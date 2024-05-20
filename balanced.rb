# def old_balanced_brackets? (entered)
#     counter = {"(" => 0, ")" => 0}
#     entered_array = entered.chars
#
#     entered_array.each do |chr|
#         if chr == "(" || chr == ")"
#             counter[chr]+=1
#         end
#     end
#
#     if counter["("] == counter[")"]
#         p true
#     else
#         p false
#     end
# end

#shows incorrect value in last test. true, when expected false.


def balanced_brackets?(entered)
    entered_array = entered.chars

    open_b = entered_array.each_with_index.filter_map {|a, i| i if a == "("}
    closed_b = entered_array.each_with_index.filter_map {|a, i| i if a == ")"}

    return false unless (open_b.empty? and closed_b.empty?) or (open_b.length == closed_b.length and open_b[0] < closed_b[0] and closed_b[-1] > open_b[-1])

    true

end

#some tests

def test_run
    tests = [
        {entered: "meow(meow)", expected: true},
        {entered: "meow))))", expected: false},
        {entered: "meowmeow", expected: true},
        {entered: "((((meow", expected: false},
        {entered: "(((meow)))", expected: true},
        {entered: "", expected: true},
        {entered: "(meow)meow", expected: true},
        {entered: ")(", expected: false}
    ]

    tests.each do |test|
        result = balanced_brackets?(test[:entered])
        if result == test[:expected]
            puts "Passed #{test[:entered]}"
        else
            puts "Failed: #{test[:entered]}"
        end
    end

end

test_run