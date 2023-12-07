file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

parts = input.split("\n\n")
seeds = parts[0].scan(/\d+/).map(&:to_i)

maps =
  parts[1..-1].map do |map|
    map.split("\n")[1..-1].map do |row| 
      row.split(' ').map(&:to_i)
    end
  end

seeds.map do |seed|
  maps.each do |line|
    line.each do |range|
      if seed.between?(range[1], range[1] + (range[2] - 1))
        seed = ((seed - range[1]) + range[0])
        break
      end
    end
  end
  seed
end
.min
.tap { puts _1 }