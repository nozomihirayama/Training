require 'rails_helper'

RSpec.describe Task, type: :model do

  it "タスク名、内容、ステータス、〆切日がある場合、有効である" do
    expect(FactoryBot.create(:task)).to be_valid
  end

  it "タスク名がない場合、無効なこと" do
    expect(FactoryBot.build(:task, name: "")).to_not be_valid
  end
  
  it "内容がない場合、無効なこと" do
    expect(FactoryBot.build(:task, content: "")).to_not be_valid
  end

  it "ステータスがない場合、無効なこと" do
    expect(FactoryBot.build(:task, status: "")).to_not be_valid
  end

  it "〆切日がない場合、無効なこと" do
    expect(FactoryBot.build(:task, deadline: "")).to_not be_valid
  end

  it "タスク名が重複している場合、無効なこと" do
    task1 = FactoryBot.create(:task)
    expect(FactoryBot.build(:task, name: task1.name)).to_not be_valid
  end

end
