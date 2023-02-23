class DNA
  def initialize(dna)
    @dna = dna
    #raise ArgumentError.new('Empty nucleotide sequence provided.') if @nucleotides.empty?
  end

  def hamming_distance(other_dna)
    shorter, longer = [dna.chars, other_dna.chars].sort { |a, b| a.size <=> b.size}
    #p shorter
    #p longer
    return 0 if shorter == []
    #p shorter.zip(longer)
    shorter.zip(longer).filter { |arr| arr.first != arr.last }.size
  end

  protected

  attr_reader :dna

end


#p DNA.new('GGACTGA')
#p DNA.new('GGACTGA').hamming_distance('GGACTGA')