require 'spec_helper'

RSpec.describe Triangle do
  it "message the shape of trianble" do
    expect(Triangle.determineShape([1,2,3])).to eq "三角形じゃないです＞＜"
  end
end
