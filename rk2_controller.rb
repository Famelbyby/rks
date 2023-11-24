class String
  def numeric?
    !Float(self).nil? rescue false
  end
end

class Rk2Controller < ApplicationController
  def input

  end

  def view
    @arr_g = params[:arr_g].split(' ')
    return if @arr_g == []

    @arr_g.count.times do |i|
      unless @arr_g[i].numeric?
        @arr_g = []
        break
      end
      @arr_g[i] = @arr_g[i].to_f
    end
    return if @arr_g == []

    @ma = @arr_g.max
    @mi = @arr_g.min
    @arr_g = [] if @ma.zero?
    @first = @arr_g.index(&:negative?)
    @arr_g[@first] = (@mi / @ma).round(8) if !@first.nil? && @first <= @arr_g.count - 1
    @res = "[#{@arr_g.join(', ')}]"
  end
end
