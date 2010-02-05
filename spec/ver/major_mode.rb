require_relative '../helper'

MajorMode = VER::MajorMode
MinorMode = VER::MinorMode
Action = VER::Action
Keymap = VER::Keymap

VER.spec do

  describe VER::MajorMode do
    before do
      MajorMode.clear
      MinorMode.clear
    end

    it 'has a name' do
      mode = MajorMode[:spec]
      mode.name.should == :spec
    end

    it 'has no minor modes at first' do
      mode = MajorMode[:spec]
      mode.minors.should.be.empty
    end

    it 'has a keymap' do
      mode = MajorMode[:spec]
      mode.keymap.should == Keymap.new
    end

    it 'returns an action for a given sequence' do
      mode = MajorMode[:spec]
      mode.map(:kill_word, ['d', 'w'])
      mode.map(:kill_line, ['d', 'd'])

      action_mode, action = mode.resolve(['d', 'w'])
      action_mode.should == mode
      action.receiver.should == nil
      action.method.should == :kill_word
    end

    it 'creates an unambigous keymap' do
      mode = MajorMode[:spec]
      mode.map(:kill_word, ['d', 'w'])
      mode.map(:kill_line, ['d', 'd'])

      action = mode.keymap['d', 'w']
      action.method.should == :kill_word
      action.receiver.should == nil

      action = mode.keymap['d', 'd']
      action.receiver.should == nil
      action.method.should == :kill_line
    end

    it 'can inherit another major mode' do
      fund = MajorMode[:Fundamental]
      fund.map(:kill_word, ['d', 'w'])
      fund.map(:kill_line, ['d', 'd'])

      ruby = MajorMode[:Ruby]
      ruby.inherits(:Fundamental)
      ruby.map(:preview, ['Control-c', 'Control-c'])

      action_mode, action = ruby.resolve(['d', 'd'])
      action_mode.should == ruby
      action.method.should == :kill_line

      action_mode, action = ruby.resolve(['d', 'w'])
      action_mode.should == ruby
      action.method.should == :kill_word

      action_mode, action = ruby.resolve(['<Control-c>', '<Control-c>'])
      action_mode.should == ruby
      action.method.should == :preview

      action_mode, action = fund.resolve(['d', 'd'])
      action_mode.should == fund
      action.method.should == :kill_line

      action_mode, action = fund.resolve(['d', 'w'])
      action_mode.should == fund
      action.method.should == :kill_word

      action = fund.resolve(['<Control-c>', '<Control-c>'])
      action.should == Keymap::IMPOSSIBLE
    end

    it 'may have a fallback that is invoked on IMPOSSIBLE results' do
      mode = MajorMode[:spec]
      mode.map(:kill_word, ['d', 'w'])
      mode.missing(:insert)

      action_mode, action = mode.resolve(['d', 'w'])
      action_mode.should == mode
      action.method.should == :kill_word

      action_mode, action = mode.resolve(['f', 'o', 'o'])
      action_mode.should == mode
      action.method.should == :insert
    end

    it 'can have minor modes' do
      major = MajorMode[:major]
      minoa = MinorMode[:minoa]
      minob = MinorMode[:minob]

      major.use(:minoa, :minob)
      major.minors.should == [minoa, minob]
    end

    it 'can replace a minor mode with another one' do
      major = MajorMode[:major]
      minoa = MinorMode[:minoa]
      minob = MinorMode[:minob]

      major.use(:minoa)
      major.minors.should == [minoa]

      major.forget(:minoa)
      major.minors.should == []

      major.use(:minob)
      major.minors.should == [minob]
    end

    it 'has a bindtag' do
      major = MajorMode[:spec]
      major.tag.name.should == 'spec-mode'
    end

    it 'can modify the parents chain of its minor modes' do
      major = MajorMode[:Fundamental]
      control = MinorMode[:control]
      count = MinorMode[:count]
      move = MinorMode[:move]
      move_count = MinorMode[:move_count]

      major.use :control
      control.inherits :move
      move_count.inherits :move, :count

      control.parents.should == [move]
      major.replace_minor(:move, :move_count)
      control.parents.should == [move_count]
      major.replace_minor(:move_count, :move)
      control.parents.should == [move]
    end
  end
end
