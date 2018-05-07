require_relative '../src/score'

describe 'Score' do

  it 'gives zero points when no rolls' do
    no_rolls = []
    expect(Score.new(no_rolls).compute).to eq(0)
  end

  it 'gives 100 points when a single roll of 1' do
    rolls = [1]
    expect(Score.new(rolls).compute).to eq(100)
  end

  it 'gives 50 points when a single roll of 5' do
    rolls = [5]
    expect(Score.new(rolls).compute).to eq(50)
  end

  it 'computes the scores of multiple rolls' do
    rolls = [1,5]
    expect(Score.new(rolls).compute).to eq(150)
  end

  it 'does not take into account invalid numbers' do
    rolls = [2,3,4,6]
    expect(Score.new(rolls).compute).to eq(0)
  end

  it 'gives 1000 points when it have three rolls of 1' do
    rolls = [1,1,1]
    expect(Score.new(rolls).compute).to eq(1000)
  end

  it 'gives the roll multiplied 100 points when it have three rolls of some number' do
    rolls = [2,2,2]
    expect(Score.new(rolls).compute).to eq(200)
    rolls = [3,3,3]
    expect(Score.new(rolls).compute).to eq(300)
    rolls = [4,4,4]
    expect(Score.new(rolls).compute).to eq(400)
    rolls = [5,5,5]
    expect(Score.new(rolls).compute).to eq(500)
    rolls = [6,6,6]
    expect(Score.new(rolls).compute).to eq(600)
  end

  it 'is trying a mix rolls' do
    rolls = [2,5,2,2,3]
    expect(Score.new(rolls).compute).to eq(250)
    rolls = [5,5,5,5]
    expect(Score.new(rolls).compute).to eq(550)
    rolls = [1,1,1,1]
    expect(Score.new(rolls).compute).to eq(1100)
    rolls = [1,1,1,1,1]
    expect(Score.new(rolls).compute).to eq(1200)
    rolls = [1,1,1,5,1]
    expect(Score.new(rolls).compute).to eq(1150)
  end
end
