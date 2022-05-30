class Game
  attr_accessor :current_player, :expected_result

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2

    @player = 1
    @expected_result = nil
  end

  def current_player
    if @player == 1
      return @player1
    elsif @player == 2
      return @player2
    end
  end

  def change_player
    if @player == 1
      @player = 2
    elsif @player == 2
      @player = 1
    end 
  end

  def random_numbers
    [rand(1..10), rand(1..10)]
  end

  def question
    operation_picker = rand(1..4)
    operation = nil
    if operation_picker == 1
      operation = 'plus'
    elsif operation_picker == 2
      operation = 'minus'
    elsif operation_picker == 3
      operation = 'times'
    elsif operation_picker == 4
      operation = 'divided by'
    end

    first_num = random_numbers[0]
    second_num = random_numbers[1]
    if operation == 'plus'
      @expected_result = first_num + second_num
      puts "#{current_player.name}: What does #{first_num} #{operation} #{second_num} equal?"
    elsif operation == 'minus'
      @expected_result = first_num - second_num
      puts "#{current_player.name}: What does #{first_num} #{operation} #{second_num} equal?"
    elsif operation == 'times'
      @expected_result = first_num * second_num
      puts "#{current_player.name}: What does #{first_num} #{operation} #{second_num} equal?"
    elsif operation == 'divided by'
      @expected_result = first_num / second_num
      puts "#{current_player.name}: What does #{first_num} #{operation} #{second_num} equal?"
    end
  end

  def game_over?
    @player1.lost? || @player2.lost?
  end

  def play
    until(game_over?) do
      question
      answer = gets.chomp().to_i
      if answer == @expected_result
        puts "#{current_player.name}: YES! You are correct."
        change_player
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      elsif answer != @expected_result
        puts "#{current_player.name}: Seriously? No!"
        current_player.lives -= 1
        change_player
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      end

      if !game_over?
        puts "----- NEW TURN -----"
      end
    end

    if @player1.lost
      winner = @player2
    elsif @player2.lost
      winner = @player1
    end

    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end