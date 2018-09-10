class Triangle
  # param: 辺の長さをカンマ区切りの文字列で指定
  def self.determineShape(param)
    if param.nil? || param.empty?
      return "辺の長さを指定してください"
    end

    str_params = param.split(/\s*,\s*/)
    if str_params.empty?
      return "辺の長さを指定してください"
    end

    int_params = []
    for param in str_params do
      param = Integer(param.strip) rescue nil
      if param.nil? || param < 0
        return "辺の長さは正の整数で指定してください"
      end
      int_params.push(param)
    end

    if int_params.length != 3 || int_params.include?(0)
      return "三角形じゃないです＞＜"
    end

    x, y, z = int_params

    if x + y <= z || y + z <= x || z + x <= y
      return "三角形じゃないです＞＜"
    end

    if x == y && y == z && z == x
      return "正三角形ですね！"
    end

    if x == y || y == z || z == x
      return "二等辺三角形ですね！"
    end

    "不等辺三角形ですね！"
  end
end

### Command Line
if $0 == __FILE__
  puts Triangle.determineShape(ARGV.join)
end
