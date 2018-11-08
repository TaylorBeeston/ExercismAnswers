class Series
  def initialize(nums)
    @nums = nums
  end

  def slices(n)
    throw ArgumentError if n > @nums.length
    newArr = []
    for i in (0..(@nums.length - n))
      newArr[i] = @nums.slice(i, n)
    end
    newArr
  end
end
