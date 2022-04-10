require 'csv'

def edit_csv(file_name, csv_mode, message)
  puts message + '(終了したらCtrl+Dを押してください)'
  input_content = readlines
  CSV.open("#{file_name}.csv", csv_mode.to_s, encoding: 'utf-8') do |csv|
    csv << input_content
  end
end

def input_file_name
  puts '１(新規でメモを作成)２(既存のメモを編集する)'
  memo_type = gets.to_i

  if [1, 2].include?(memo_type)
    puts 'ファイル名を入力してください(拡張子を除く)'
    file_name = gets.to_s.chomp

    if memo_type == 1
      edit_csv(file_name, 'w', '内容を記入してください')
    elsif memo_type == 2
      edit_csv(file_name, 'a', '編集する内容を記入してください')
    end
  else
    puts '※ 1または2を入力してください'
    input_file_name
  end
end

input_file_name
