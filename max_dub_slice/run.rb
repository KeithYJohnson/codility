def solution(a)
  max_sum = a[0..2].inject(:+)

  0.upto(a.length - 3) do |i|

    (i + 1).upto(a.length - 2) do |j|

      (j + 1).upto(a.length - 1) do |k|
        sum = 0

        x_start_idx = i + 1
        y_start_idx = j - 1
        z_start_idx = k - 1

        while x_start_idx < y_start_idx
          sum += a[x_start_idx]
          x_start_idx += 1
        end

        while y_start_idx < z_start_idx
          if y_start_idx == j
            y_start_idx += 1
            next
          end

          sum         += a[y_start_idx]
          y_start_idx += 1
        end

        sum += a[z_start_idx]
        max_sum = sum if sum > max_sum
      end
    end
  end
  max_sum
end

# a = [3, 2, 6, -1, 4, 5, -1, 2]
a = [-5, -5, -5]

p solution(a)
