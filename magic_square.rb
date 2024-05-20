def is_magic_square? (square)
    n = square.length
    return false if n == 0 || square.any? { |row| row.length != n}

    check = square[0].sum

    return false unless square.all? { |row| row.sum == check}

    return false unless (0...n).all? { |col| square.map { |row| row[col] }.sum == check}

    return false unless (0...n).map { |i| square[i][i] }.sum == check

    return false unless (0...n).map { |i| square[i][n-i-1] }.sum == check

    true

end

#test

def test_run
    tests = [
      { square: [[8, 1, 6], [3, 5, 7], [4, 9, 2]], expected: true, description: 'Valid 3x3 magic square' },
      { square: [[8, 1, 6], [3, 5, 7], [4, 9, 3]], expected: false, description: 'Invalid 3x3 magic square (one element off)' },
      { square: [[1, 2, 3], [4, 5, 6]], expected: false, description: 'Non-square array' },
      { square: [
          [16, 2, 3, 13],
          [5, 11, 10, 8],
          [9, 7, 6, 12],
          [4, 14, 15, 1]
        ], expected: true, description: 'Valid 4x4 magic square' },
      { square: [
          [16, 2, 3, 13],
          [5, 11, 10, 8],
          [9, 7, 6, 12],
          [4, 14, 15, 2]
        ], expected: false, description: 'Invalid 4x4 magic square (one row off)' },
      { square: [], expected: false, description: 'Empty array' },
      { square: [[1]], expected: true, description: 'Valid 1x1 magic square' }
    ]
  
    tests.each do |test|
      result = is_magic_square?(test[:square])
      if result == test[:expected]
        puts "Passed: #{test[:description]}, #{test:[expected]}"
      else
        puts "Failed: #{test[:description]}"
      end
    end

end

test_run