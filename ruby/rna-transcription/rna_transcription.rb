class Complement
  DNA, RNA = "GCTA", "CGAU"

  def self.of_dna(nuceloetides)
    nuceloetides.tr(DNA, RNA)
  end
end
