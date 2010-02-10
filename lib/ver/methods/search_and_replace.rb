module VER
  module Methods
    module SearchAndReplace
      HIGHLIGHT = Search::HIGHLIGHT
      TAG = :search_and_replace

      module_function

      def leave(text, old_mode, new_mode)
        text.tag_remove(TAG, 1.0, :end)
      end

      def enter(text, old_mode, new_mode)
        pattern = text.store(self, :pattern)
        text.tag_all_matching(TAG, pattern, HIGHLIGHT)
        from, to = text.tag_nextrange(TAG, 'insert + 1 chars', 'end')
        text.mark_set(:insert, from) if from

        VER.message 'Replace occurence (y)es (n)o (a)ll (q)uit'
      end

      def query(text)
        if old_pattern = text.store(self, :pattern)
          old_pattern = old_pattern.inspect[1..-1]
        end

        text.ask 'Replace pattern: /', value: old_pattern do |pattern, action|
          case action
          when :attempt
            pattern << '/i' unless pattern =~ /\/[ixm]*$/

            begin
              regexp = eval("/#{pattern}")
            rescue RegexpError, SyntaxError
              regexp = Regexp.new(Regexp.escape(term))
            end

            text.store(self, :pattern, regexp)

            VER.defer do
              old_replacement = text.store(self, :replacement)
              question = "Replace %p with: " % [regexp]
              text.ask question, value: old_replacement do |replacement, action|
                case action
                when :attempt
                  text.store(self, :replacement, replacement)
                  text.minor_mode(:control, :search_and_replace)
                  :abort
                end
              end
            end

            :abort
          end
        end
      end

      def replace_once(text)
        from, to = text.tag_nextrange(TAG, 'insert', 'end')
        text.replace(from, to, text.store(self, :replacement))
        text.tag_all_matching(TAG, text.store(self, :pattern), HIGHLIGHT)
        from, to = text.tag_nextrange(TAG, 'insert + 1 chars', 'end')
        text.mark_set(:insert, from) if from

        VER.message 'Replace occurence (y)es (n)o (a)ll (q)uit'
      end

      def replace_all(text)
        replacement = text.store(self, :replacement)
        from, to = text.tag_nextrange(TAG, 'insert', 'end')
        return unless from

        Undo.record text do |record|
          begin
            record.replace(from, to, replacement)
            text.mark_set(:insert, from)
            from, to = text.tag_nextrange(TAG, 'insert + 1 chars', 'end')
          end while from
        end
      end

      def next(text)
        from, to = text.tag_nextrange(TAG, 'insert + 1 chars', 'end')
        text.mark_set(:insert, from) if from

        VER.message 'Replace occurence (y)es (n)o (a)ll (q)uit'
      end

      def prev(text)
        from, to = text.tag_prevrange(TAG, 'insert', '1.0')
        text.mark_set(:insert, from) if from

        VER.message 'Replace occurence (y)es (n)o (a)ll (q)uit'
      end
    end
  end
end
