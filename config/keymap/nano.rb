module VER
  options.horizontal_scrollbar = false
  options.vertical_scrollbar = false

  aliases = Hash.new{|h,k| k }

  major_mode :Fundamental do
    use :control

    # Still have to check what this is on other platforms
    if x11?
      aliases['<F13>'] = '<XF86_Switch_VT_1>'
      aliases['<F14>'] = '<XF86_Switch_VT_2>'
      aliases['<F16>'] = '<XF86_Switch_VT_4>'
    end
  end

  major_mode :MiniBuffer do
    use :basic, :readline

    map :abort,          '<Escape>', '<Control-c>', '<Control-x>'
    map :attempt,        '<Return>'
    map :complete_large, '<Tab><Tab>'
    map :complete_small, '<Tab>'
  end

  major_mode :HoverCompletion do
    use :basic

    map :cancel,              '<Escape>', '<BackSpace>'
    map :continue_completion, '<Right>', '<Tab>'
    map :go_down,             '<Down>', '<Control-p>'
    map :go_up,               '<Up>', '<Control-n>'
    map :submit,              '<Return>'
  end

  minor_mode :readline do
    map :accept_line,       '<Return>'

    map :end_of_line,       '<End>', '<Control-e>'
    map :insert_selection,  '<Shift-Insert>'
    map :insert_tab,        '<Control-v><Tab>'
    map :kill_end_of_line,  '<Control-k>'
    map :kill_next_char,    '<Control-d>', '<Delete>'
    map :kill_next_word,    '<Alt-d>'
    map :kill_prev_char,    '<BackSpace>'
    map :kill_prev_word,    '<Control-w>'
    map :next_char,         '<Right>', '<Control-f>'
    map :next_word,         '<Shift-Right>', '<Alt-f>'
    map :prev_char,         '<Left>', '<Control-b>'
    map :prev_word,         '<Shift-Left>', '<Alt-b>'
    map :start_of_line,     '<Home>', '<Control-a>'
    map :transpose_chars,   '<Control-t>'

    map :sel_prev_char,     '<Shift-Left>'
    map :sel_next_char,     '<Shift-Right>'
    map :sel_prev_word,     '<Shift-Control-Left>'
    map :sel_next_word,     '<Shift-Control-Right>'
    map :sel_start_of_line, '<Shift-Home>'
    map :sel_end_of_line,   '<Shift-End>'

    missing :insert_string
  end

  minor_mode :basic do
    map :quit, '<Control-x>'
  end

  minor_mode :control do
    inherits :basic

    map :start_select_char_mode, '<Control-asciicircum>'

    map :undo, '<Alt-u>'
    map :redo, '<Alt-e>'
    map :save, '<Control-o>', '<F3>'

    handler Methods::Help
    map :nano, '<Control-g>', '<F1>'

    handler Methods::Layout
    map :close, '<Control-x>', '<F2>'
    map :focus_prev,  '<Alt-less>', '<Alt-comma>'
    map :focus_next,  '<Alt-greater>', '<Alt-period>'

    handler Methods::Control
    map :wrap_line, '<Control-j>', '<F4>'

    handler Methods::Insert
    map :file, '<Control-w>', '<F6>'
    map :newline, '<Return>', '<Control-m>'
    missing :string

    handler Methods::Search
    map :status_next, '<Control-w>', '<F6>'
    map :again,       '<Alt-w>', aliases['<F16>']

    handler :at_insert
    map :ask_go_line,                 '<Control-underscore>', aliases['<F13>']
    map :backward_scroll,             '<Alt-minus>', '<Alt-underscore>'
    map :end_of_file,                 '<Alt-slash>', '<Alt-question>'
    map :end_of_line,                 '<End>', '<Control-e>'
    map :forward_scroll,              '<Alt-plus>', '<Alt-equal>'
    map :indent_line,                 '<Alt-bracketright>'
    map :kill_line,                   '<Control-k>', '<F9>'
    map :matching_brace,              '<Control-bracketleft>'
    map :next_char,                   '<Right>', '<Control-f>'
    map :next_line,                   '<Control-n>', '<Down>'
    map :next_page,                   '<Control-v>', '<F8>'
    map :next_word,                   '<Shift-Right>', '<Alt-f>', '<Control-space>'
    map :prev_char,                   '<Left>', '<Control-b>'
    map :prev_line,                   '<Control-p>', '<Up>'
    map :prev_page,                   '<Control-y>', '<F7>'
    map :prev_word,                   '<Shift-Left>', '<Alt-b>', '<Alt-space>'
    map :start_of_file,               '<Alt-backslash>', '<Alt-bar>'
    map :start_of_line,               '<Home>', '<Control-a>'
    map :unindent_line,               '<Alt-braceleft>'
    map [:kill_motion, :end_of_file], '<Alt-t>'

    # M-(     (M-9)           Go to beginning of paragraph; then of previous paragraph
    map :start_of_paragraph, '<Control-braceleft>', '<Alt-Key-9>'
    # M-)     (M-0)           Go just beyond end of paragraph; then of next paragraph
    map :end_of_paragraph, '<Control-braceright>', '<Alt-Key-0>'

    handler Methods::SearchAndReplace
    map :query, '<Control-backslash>', aliases['<F14>'], '<Alt-r>'

    handler Methods::Clipboard
    map :paste, '<Control-u>', '<F10>'
    map :copy_line, '<Alt-asciicircum>'

    handler Methods::Nano
    map :verbatim, ['<Alt-v>', :verbatim]
    map :home, '<Home>'
    map :suspend, '<Control-z>'
    map :redraw, '<Control-l>'
    map :toggle_help_mode, '<Alt-x>'
    map :toggle_cursor_pos, '<Alt-c>'
    map :toggle_one_more_line, '<Alt-o>'
    map :toggle_smooth_scrolling, '<Alt-s>'
    map :toggle_whitespace_display, '<Alt-p>'
    map :toggle_color_syntax_highlighting, '<Alt-y>'
    map :toggle_smart_home_key, '<Alt-h>'
    map :toggle_auto_indent, '<Alt-i>'
    map :toggle_cut_to_end, '<Alt-k>'
    map :toggle_long_line_wrapping, '<Alt-l>'
    map :toggle_convert_typed_tabs_to_spaces, '<Alt-q>'
    map :toggle_backup_files, '<Alt-b>'
    map :toggle_multiple_file_buffers, '<Alt-f>'
    map :toggle_mouse, '<Alt-m>'
    map :toggle_dos_mac_format_conversion, '<Alt-n>'
    map :toggle_suspension, '<Alt-z>'
    map :toggle_soft_line_wrapping, '<Alt-dollar>'

    ## Missing
    # M-J                     Justify the entire file
    # M-D                     Count the number of words, lines, and characters
    # ^C      (F11)           Display the position of the cursor
    # ^T      (F12)           Invoke the spell checker, if available
    # ^^      (F15)   (M-A)   Mark text at the cursor position
  end

  minor_mode :verbatim do
    handler Methods::Nano

    # try mapping all possible combinations.
    mods = %w[Alt Control Control-Alt]
    (0..255).each do |ord|
      chr = ord.chr
      next unless chr =~ /[[:print:]]/
      keysym = VER::Event[chr].keysym
      map :verbatim_insert, "<#{keysym}>", *mods.map{|mod| "<#{mod}-#{keysym}>" }
    end

    missing :verbatim_insert
  end
end
