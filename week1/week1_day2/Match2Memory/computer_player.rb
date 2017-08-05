class ComputerPlayer
  attr_accessor :memory, :match_positions
  def initialize(num_cards)
    @memory = Array.new(2) {Array.new(num_cards/2)}
  end

  def first_turn
    match_positions = check_matches
    if match_positions.length > 0
      pos = match_positions[0]
    else
      pos = pick_random
    end
    pos
  end

  def second_turn(last_card, last_pos)
    matched = valid_positions do |elem|
      elem == last_card.name
    end
    p "matched: #{matched}"
    p "last_pos: #{last_pos}"
    matched.delete(last_pos)
    p "matched_after: #{matched}"
    if matched.length > 0
      @memory[last_pos[0]][last_pos[1]] = 0
      p "last_card: #{@memory[matched[0].first][matched[0].last]}"
      @memory[matched[0].first][matched[0].last] = 0
      p "last_card: #{@memory[matched[0].first][matched[0].last]}"
      matched[0]
    else
      pick_random
    end
  end

  def check_matches
    counts = Hash.new(0)
    @memory.each do |row|
      row.each {|el| counts[el]+=1 unless el.nil? || el==0}
    end
    positions = valid_positions do |elem|
      counts[elem] == 2
    end
    positions
  end

  def valid_positions(&blk)
    valids = []
    @memory.each.with_index do |row, idx1|
      row.each.with_index do |elem, idx2|
        valids << [idx1,idx2] if blk.call(elem)
      end
    end
    valids
  end

  def pick_random
    positions = valid_positions do |elem|
      elem.nil?
    end
    positions.sample
  end

  def update(card, pos)
    unless @memory[pos[0]][pos[1]] == 0
      @memory[pos[0]][pos[1]] = card.name
    end
  end
end
