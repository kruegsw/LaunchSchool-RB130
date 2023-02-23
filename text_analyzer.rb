

class TextAnalyzer
  def process
    lines_array =  File.readlines('sample_text.txt')
    yield(lines_array) if block_given?
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |lines| puts "#{lines.count { |line| line == "\n"} + 1 } paragraphs"}
analyzer.process { |lines| puts "#{lines.size} lines" }
analyzer.process { |lines| puts "#{lines.reduce(0) { |sum, line| sum += line.split.size } } words" }