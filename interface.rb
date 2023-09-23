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

end