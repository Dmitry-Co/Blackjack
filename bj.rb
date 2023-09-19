# 
class Main
  
  class Card
    attr_reader :suit, :value, :points
  
    def initialize
      @suit = 'Ace'
      @value = '11'
    end
   
    # понимал что метод нужно для очков но что именно значение десять нужно просто поставить в метод не понимал. Хотя в ТЗ ясно написано вычитается по 10 очков у каждого.
    def points 
      10
    end

  end
  
  class Deck
    attr_accessor :cards, :take_card # создал для доступ из класса Game для метода show_status

    def initialize
      @cards = []
    end
  
    def generate
      52.times do
        @cards << Card.new
      end
      @cards.shuffle
    end

    def take_card 
      @cards -= # ???
    end
    
  end

  class Player
    attr_accessor :cards

    def initialize
      @balance = 100
      @cards = []
    end

    def show_hidden_cards
      @cards.map {|card| p "#{}"} # найти метод который замещает значение * но не изменяет исходного значения переменной
    end

    def show_cards
      @cards.each {|card| p card}
    end


    def make_move # делаем ход
      @cards.pop
    end

    # не знал как сделать метод подсчета в очках через карты
    def points
      cards.map {|card| puts card.points}.sum
    end
  end

  class Game
    def initialize # не додумал сам, что нужно создать экземпляры. Хотя это очевидно.
      @deck = Deck.new
      @player = Player.new
      @dealer = Player.new
    end
    @deck = Deck.new.generate
  end

    def start
      ask_name
      play_round
      define_winner
      winner_process
      play_again?
    end

    def ask_name
      puts 'Please input your name: '
    end
    
    def play_round
      
      def play_round
        2.times do
          @player.cards << @deck.take_card
          @dealer.cards << @deck.take_card
        end
        
        show_status

        @dealer.make_move
        @player.make_move
      end

      def show_status
        puts "player card is #{@player.show_cards}"
        puts "dealer card is #{@dealer.show_hidden_cards}"
        @cards
      end

      # не понял как определить победителя, что с чем связать
      def define_winner
         if @player.points > @dealer.points
          puts "#{@player} won!"
          elsif @player.points < @dealer.points 
            puts "#{@dealer} won!" 
            else
              puts "Draw!"
      end

      def winner_process
        raise "Not implemented"
      end

      def play_again
        puts 'One more game?: '
        true
      end
  end
    
  def exit(choice)
      choice.zero?
  end
end
Main.new.start