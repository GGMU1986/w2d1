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

  def my_count(val)
    count = 0

    self.each { |ele| count += 1 if ele == val }

    count
  end

  def my_index(val)
    (0...self.length - 1).each do |i|
      return i if self[i] == val
    end

    nil
  end

  def my_uniq
    h = {}

    self.each { |ele| h[ele] = true }

    h.keys
  end

  def my_transpose
    h = Hash.new { |h, k| h[k] = [] }
    
    self.each do |sub|
      (0...sub.length).each do |i|
        h[i] << sub[i]
      end
    end
    h.values
  end
end
