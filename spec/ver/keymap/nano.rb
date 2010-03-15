require_relative '../../helper'

shared :with_buffer do
  before do
    @buffer ||= VER.layout.create_buffer
    VER.layout.add_buffer(@buffer)
    @buffer.value = <<-TEXT.chomp
Fugiat eos voluptatum officia fugit ad sit qui.
Alias et voluptas sapiente sed.
Unde ut qui esse repellendus sunt dolorum officia.
Officia accusamus perferendis ab.
Nesciunt repellendus et recusandae dolorum quis repudiandae ad minima.
Ducimus quo et ea.
Qui cumque blanditiis aliquam accusamus perspiciatis provident sapiente fuga.
    TEXT
    @buffer.insert = '1.0'
    @buffer.major_mode = VER::MajorMode[:Fundamental]
    @insert = @buffer.at_insert
  end

  after do
    Tk.update
  end

  def buffer
    @buffer
  end

  def insert
    @insert
  end

  def type(string)
    buffer.type(string)
  end

  def minibuf
    buffer.minibuf
  end

  def clipboard
    VER::Clipboard.dwim
  end

  def clipboard_set(string)
    VER::Clipboard.dwim = string
  end
end

shared :control_mode do
  behaves_like :with_buffer

  before do
    clipboard_set 'foo'
  end
end

VER.spec keymap: 'nano', hidden: false do
  describe 'Nano keymap' do
    behaves_like :control_mode

    should 'go to end of line with <End>' do
      type '<End>'
      insert.index.should == '1.0 lineend'
    end

    should 'use <BackSpace> to delete previous char' do
      insert.index = '1.2'
      type '<BackSpace>'
      insert.get('linestart', 'linestart + 5 chars').should == 'Fgiat'
    end

    should 'use <Delete> to delete next char' do
      insert.index = '1.2'
      type '<Delete>'
      insert.get('linestart', 'linestart + 5 chars').should == 'Fuiat'
    end

    should 'use <Alt-t> to delete to end of buffer' do
      insert.index = '1.6'
      type '<Alt-t>'
      buffer.value.should == "Fugiat\n"
    end

    should 'use <Alt-braceleft> to unindent a line' do
      buffer.value = "  some line"
      type '<Alt-braceleft>'
      buffer.value.should == "some line\n"
    end

    should 'insert verbatim character with <Alt-v> prefix' do
      buffer.value = ''
      type '<Alt-v><Control-j>'
      buffer.value.should == "\n\n"
    end

    should 'insert corresponding ascii character for <Escape><Escape>\d\d\d' do
      buffer.value = ''
      buffer.minor_mode?(:ascii_digit).should.be.nil
      type '<Escape><Escape>'
      buffer.minor_mode?(:ascii_digit).should.not.be.nil
      type '0'
      buffer.minor_mode?(:ascii_digit).should.not.be.nil
      buffer.value.should == "\n"
      type '4'
      buffer.minor_mode?(:ascii_digit).should.not.be.nil
      buffer.value.should == "\n"
      type '2'
      buffer.minor_mode?(:ascii_digit).should.be.nil
      buffer.value.should == "*\n"
    end

    should 'go line down with <Down>' do
      type '<Down>'
      insert.index.should == '2.0'
    end

    should 'go line up with <Up>' do
      insert.index = '2.0'
      type '<Up>'
      insert.index.should == '1.0'
    end

    should 'go to next character with <Right>' do
      type '<Right>'
      insert.index.should == '1.1'
    end

    should 'go to previous character with <Left>' do
      insert.index = '1.1'
      type '<Left>'
      insert.index.should == '1.0'
    end
  end
end
