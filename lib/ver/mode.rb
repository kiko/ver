module VER
  class Mode < Struct.new(
    :keymap, :name, :arguments, :stack, :mapping, :ancestors, :missing, :tag
  )
    MERGER = proc{|key, v1, v2|
      if v1.respond_to?(:merge) && v2.respond_to?(:merge)
        v1.merge(v2, &MERGER)
      else
        v2
      end
    }

    def inspect
      "#<Mode #{name}>"
    end

    def initialize(name, keymap, tag)
      self.name, self.keymap, self.tag = name, keymap, tag
      self.stack = []
      self.mapping = {}
      self.ancestors = []
      self.missing = nil
      self.arguments = keymap.arguments
    end

    def inherits(*others)
      others.flatten.each do |other|
        ancestor = find_ancestor(other.to_sym)
        ancestors.delete ancestor
        ancestors.unshift ancestor
      end
    end

    def includes(*others)
      others.flatten.each do |other|
        ancestor = find_ancestor(other.to_sym)
        ancestors.delete ancestor
        ancestors.push ancestor
      end
    end

    def no_arguments
      self.arguments = false
    end

    def find_ancestor(name)
      if found = keymap.modes[name.to_sym]
        return found
      else
        raise "Mode #{name} is not specified yet"
      end
    end

    def each_ancestor(*done, &block)
      yield self

      ancestors.each do |ancestor|
        next if done.include?(ancestor)
        yield ancestor
        ancestor.each_ancestor(done + [self], &block)
      end
    end

    def missing(sym)
      self.missing = sym
    end

    def map(sym, *keychains)
      keychains.each do |keychain|
        bind(keychain.flatten, sym)
      end
    end
    alias key map

    def bind(keychain, action_name = nil, &block)
      keychain = keychain.dup
      total = hash = {}

      while key = keychain.shift
        if key.is_a?(Symbol)
          canonical = keymap.modes[key]
        else
          canonical = register(key)
        end

        if keychain.empty?
          hash[canonical] = block || action_name
        else
          hash = hash[canonical] = {}
        end
      end

      mapping.replace(mapping.merge(total, &MERGER))
    end

    def register(key)
      tag.register(key)
    end

    def enter_keys(widget, *keys)
      keys.flatten.each{|key| enter_key(widget, key) }
    end

    def enter_key(widget, key)
      stack << key

      each_ancestor do |ancestor|
        result = ancestor.attempt_execute(widget, stack.dup)

        case result
        when nil # nothing matched yet, but possible in future
          return nil
        when false # nothing possible
          # try next one
        when true # executed
          stack.clear
          return true
        else
          raise "%p is not a valid result" % [result]
        end
      end

      # no ancestors or all failed
      stack.clear
      enter_missing(widget, key)
    rescue => ex
      VER.error(ex)
      stack.clear
    end

    def enter_missing(widget, key)
      missing = self[:missing]
      execute(widget, missing, key) if missing
    end

    def attempt_execute(widget, original_stack, lookup = false)
      if arguments
        stack, arg = Mode.split_stack(original_stack)
      else
        stack, arg = original_stack, nil
      end

      if stack.empty?
        arg ? nil : false
      else
        executable = mapping
        while key = stack.shift
          previous = executable
          executable = executable[key]

          case executable
          when nil
            return false unless previous.respond_to?(:find)

            # FIXME: this allows only one mode
            found = previous.find{|prev_key, prev_value| prev_key.is_a?(Mode) }
            return false unless found

            mode, action = found
            looked = mode.attempt_execute(widget, [key, *stack], true)

            case looked
            when false
              return false
            when nil
              return nil
            else
              cmd, cmd_arg = looked
              return nil if cmd.is_a?(Hash)
              return execute(widget, action, cmd, arg)
            end
          end
        end

        if lookup
          return widget, executable, arg
        else
          execute(widget, executable, *arg)
        end
      end
    end

    def execute(widget, executable, *arg)
      arg = [*arg].compact # doesn't allow nil
      case executable
      when Hash
        return nil
      when Symbol
        widget.send(executable, *arg)
      when Array
        widget.send(*executable, *arg)
      when Proc
        executable.call(widget, earg)
      else
        return false
      end

      true
    rescue ArgumentError => ex
      VER.status.message("#{executable} : #{ex}")
      true
    end

    def self.split_stack(stack)
      first = stack[0]
      return stack, nil if first == '0' || first == '<KeyPress-0>'

      pivot = stack.index{|c| c !~ /^(<KeyPress-\d+>|\d+)$/ }

      if pivot == 0
        return stack, nil
      elsif pivot
        keys, args = stack[pivot..-1], stack[0..pivot]
        return keys, args.join.scan(/\d+/).join.to_i
      else
        return [], stack.join.to_i
      end
    end
  end
end
