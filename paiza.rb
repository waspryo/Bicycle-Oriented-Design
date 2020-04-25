


# puts '文字列一致ゲーム'
# puts "*---------------*"

# puts '一つ目の文字を入力してください'
# str   = gets.chomp().to_s
# puts '2つ目の文字を入力してください'
# num = gets.chomp().to_s

# if str == num
#   puts 'yes'
# elsif str != num
#   puts 'no'
# end
# # ---------------------------------------------------------------------------------------
# registrants = gets.chomp().to_i
# goalNum     = gets.chomp().to_i

# if registrants <= goalNum
#   puts goalNum - registrants
# elsif registrants >= goalNum
#   puts 'Thank you'
# end
# # ---------------------------------------------------------------------------------------
# dozen = gets.chomp().to_i
# pen = 12
# puts dozen * pen

# # ---------------------------------------------------------------------------------------
# # 時給 =   houlyWage
# # 9-17    1200円
# # 17-22   1400円
# # 22-23   1600円
# # 0-9     1600円

# # 労働時間 = workingHours

# # houlyWage = gets.chomp()
# # puts houlyWage

# # workingTime = gets.chomp()
# # puts workingTime

# # morningWage   = 1000
# # afternoonWage = 1200
# # nightWage     = 1500

# # workingHours = gets.chomp().to_i
# # workRange = gets.chomp()
# # if workRange.to_i >= 9 && workRange.to_i <= 17
# #   # puts houlyWage * workingHours
# #   puts '9時から17時の間で働いています。'
# #   puts morningWage * workingHours
# # elsif workRange.to_i >= 18 && workRange.to_i <= 22
# #   # puts houlyWage * workingHours
# #   puts afternoonWage * workingHours
# #   puts '17時から22時の間で働いています。'
# # elsif workRange.to_i >= 22 && workRange.to_i <= 23
# #   # puts houlyWage * workingHours
# #   puts nightWage * workingHours
# #   puts '22時から23時の間で働いています。'
# # elsif workRange.to_i >= 0 && workRange.to_i <= 9
# #   # puts houlyWage * workingHours
# #   puts nightWage * workingHours
# #   puts '0時から9時の間で働いています。'
# # elsif workRange == nil
# #   puts '働いていません'
# # end


# chargeCard = gets.chomp().to_i

# if chargeCard < 10000
#   puts 10000 + chargeCard, "チャージされました"
# elsif chargeCard === 10000
#   puts chargeCard
#   puts '残高が減っていないのでチャージは行いません'
# end

# import java.util.*;


# public class Main {
#     public static void main(String[] args) {
#         // 自分の得意な言語で
#         // Let's チャレンジ！！
#     if(args[0] == args[1]){

#         System.out.println("Yes");
#     }   else{

#         System.out.println("No");
#     }


#     }
# }

# puts 'Start'
#   module Greeter
#     def hello
#       'hello'
#     end
#   end

#   begin
#     greeter = Greeter.new
#   rescue => exception
#     puts '例外が発生したがここまま実行する'
#   end

#   puts 'End'

def method_1
  puts 'method_1 start'
  begin
    method_2
  rescue => exception
    puts '例外が発生しました'
  end
  puts 'method_1 End'
end

def method_2
  puts "method_2 start"
  method_3
  puts 'method_2 end'
end

def method_3
puts 'method_3 start'
1 / 0
puts 'method_3 end'
end

method_1