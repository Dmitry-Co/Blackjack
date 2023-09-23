module Interface
  
  CHOICES_MENU = {
    '1' => { label: 'Взять карту',    action: :take },
    '2' => { label: 'Открыть карты',  action: :open },
    '3' => { label: 'Пропустить ход', action: :skip}
  }

  GAME_MENU = {
    '1' => { label: 'Продожить игру',               action: :continue },
    '0' => { label: 'Взять деньги и покинуть игру', action: :exit }
  }

  # functions

  def welcome_message
    puts '--- Добро пожаловать ---'
    puts '--- в игру Blackjack ---'
  end
  
  def name
    ask('=> Как вас завут?')
  end

  def menu(menu)
    showmenu(menu)
    while choice = menu[ask('?>').to_s] || {}
      break choice[:action] unless choice[:action].nil?

      unknown_command
    end
  end

  def unknown_command
    puts '=> unknown command'
  end

  def showmenu
    puts '-------------'
    menu.each { |k, v| puts "#{k} - #{v[:label]}" }
    puts '-------------'
  end
end