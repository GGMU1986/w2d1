# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    sum = 0.0

    self.each { |ele| sum += ele }

    sum / self.length
  end

  def median
    return nil if self.empty?
    arr = self.sort
    if arr.length % 2 == 1
        return arr[arr.length / 2]
    else
        new_arr = arr[((arr.length / 2) - 1)..(arr.length / 2)]
        return new_arr.average
    end
  end

  def counts
    h = Hash.new(0)

    self.each { |ele| h[ele] += 1 }

    h
  end
end
