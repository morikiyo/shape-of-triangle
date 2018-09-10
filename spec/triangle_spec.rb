require 'spec_helper'

TARGET_FILE = 'triangle.rb'
require_relative File.join('..', TARGET_FILE)

describe Triangle do
  describe "#determineShape" do
    it "message Argument Error" do
      message = "辺の長さは正の整数で指定してください"
      expect(Triangle.determineShape(['5','3','x'])).to eq message
      expect(Triangle.determineShape(['5','3','0'])).to eq message
      expect(Triangle.determineShape(['5','3','-1'])).to eq message
    end

    it "message Not Triangle" do
      message = "三角形じゃないです＞＜"
      expect(Triangle.determineShape(['1','2'])).to eq message
      expect(Triangle.determineShape(['1','2','4','1'])).to eq message
    end

    it "message Equilateral Triangle" do
      message = "正三角形ですね！"
      expect(Triangle.determineShape(['5','5','5'])).to eq message
      expect(Triangle.determineShape(['173','173','173'])).to eq message
    end

    it "message Isosceles Triangle" do
      message = "二等辺三角形ですね！"
      expect(Triangle.determineShape(['3','3','5'])).to eq message
      expect(Triangle.determineShape(['5','3','3'])).to eq message
      expect(Triangle.determineShape(['3','5','3'])).to eq message
    end

    it "message Scalene Triangle" do
      message = "不等辺三角形ですね！"
      expect(Triangle.determineShape(['3','5','2'])).to eq message
    end
  end

  describe "Command Line" do

    let(:command) { File.join(File.dirname(__FILE__), "..", TARGET_FILE) }

    it "print to stdout" do
      expect {
        puts `ruby #{command} 4, 3, 4`
      }.to output("二等辺三角形ですね！\n").to_stdout

      expect {
        puts `ruby #{command} 4 3 4`
      }.to output("二等辺三角形ですね！\n").to_stdout
    end

    it "print to stdout as in the problem example" do
      expect {
        puts `ruby #{command} 2, 3, 4`
      }.to output("不等辺三角形ですね！\n").to_stdout

      expect {
        puts `ruby #{command} 2, 2, 1`
      }.to output("二等辺三角形ですね！\n").to_stdout

      expect {
        puts `ruby #{command} 1, 1, 1`
      }.to output("正三角形ですね！\n").to_stdout

      expect {
        puts `ruby #{command} 1, 2, 3, 4`
      }.to output("三角形じゃないです＞＜\n").to_stdout
    end
  end
end
