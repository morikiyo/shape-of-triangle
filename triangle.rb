class Triangle
  # args: 辺の長さの配列
  def self.determineShape(args)
    # argument validation
    lens = []
    args.each {|arg|
      len = Integer(arg) rescue nil
      if len.nil? || len <= 0
        return "辺の長さは正の整数で指定してください"
      end
      lens.push(len)
    }

    if lens.length != 3
      return "三角形じゃないです＞＜"
    end

    if lens[0] == lens[1] && lens[1] == lens[2] && lens[2] == lens[0]
      return "正三角形ですね！"
    end

    if lens[0] == lens[1] || lens[1] == lens[2] || lens[2] == lens[0]
      return "二等辺三角形ですね！"
    end

    "不等辺三角形ですね！"
  end
end

### Command Line
if $0 == __FILE__
  # コマンドライン引数から末尾のカンマを除去する
  args = []
  ARGV.each {|arg|
    if arg =~ /,$/
      args.push(arg.chop)
    else
      args.push(arg)
    end
  }

  puts Triangle.determineShape(args)
end
