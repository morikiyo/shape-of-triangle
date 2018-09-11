require 'spec_helper'

TARGET_FILE = 'triangle.rb'
require_relative File.join('..', TARGET_FILE)

describe Triangle do
  describe "#determineShape" do
    context "argument validation" do
      it "message Argument Error" do
        message = "辺の長さを指定してください"
        expect(Triangle.determineShape(nil)).to eq message
        expect(Triangle.determineShape('')).to eq message
        expect(Triangle.determineShape(',')).to eq message
        expect(Triangle.determineShape(',,')).to eq message

        message = "辺の長さは正の整数で指定してください"
        expect(Triangle.determineShape('5, 3, x')).to eq message
        expect(Triangle.determineShape('5, 3, -1')).to eq message
      end
    end

    context "judgement triangle" do
      it "message Not Triangle" do
        message = "三角形じゃないです＞＜"
        expect(Triangle.determineShape('1, 2')).to eq message
        expect(Triangle.determineShape('1, 2, 4, 1')).to eq message

        expect(Triangle.determineShape('2, 3, 5')).to eq message
        expect(Triangle.determineShape('5, 2, 3')).to eq message
        expect(Triangle.determineShape('3, 5, 2')).to eq message

        expect(Triangle.determineShape('1, 2, 4')).to eq message
        expect(Triangle.determineShape('4, 1, 2')).to eq message
        expect(Triangle.determineShape('2, 4, 1')).to eq message
      end

      it "message Equilateral Triangle" do
        message = "正三角形ですね！"
        expect(Triangle.determineShape('5, 5, 5')).to eq message
      end

      it "message Isosceles Triangle" do
        message = "二等辺三角形ですね！"
        expect(Triangle.determineShape('3, 3, 5')).to eq message
        expect(Triangle.determineShape('5, 3, 3')).to eq message
        expect(Triangle.determineShape('3, 5, 3')).to eq message
      end

      it "message Scalene Triangle" do
        message = "不等辺三角形ですね！"
        expect(Triangle.determineShape('2, 4, 5')).to eq message
        expect(Triangle.determineShape('5, 2, 4')).to eq message
        expect(Triangle.determineShape('4, 5, 2')).to eq message
      end
    end

    context "parameter contains any spaces" do
      it "message Equilateral Triangle" do
        message = "正三角形ですね！"
        expect(Triangle.determineShape('173,173,173')).to eq message
        expect(Triangle.determineShape('173  , 173 ,  173')).to eq message
      end
    end
  end

  describe "Command Line" do

    let(:command) { File.join(File.dirname(__FILE__), "..", TARGET_FILE) }

    it "print to stdout as in the problem example" do
      expect(`ruby #{command} 2, 3, 4`).to eq "不等辺三角形ですね！\n"
      expect(`ruby #{command} 2, 2, 1`).to eq "二等辺三角形ですね！\n"
      expect(`ruby #{command} 1, 1, 1`).to eq "正三角形ですね！\n"
      expect(`ruby #{command} 1, 2, 3`).to eq "三角形じゃないです＞＜\n"
    end
  end
end
