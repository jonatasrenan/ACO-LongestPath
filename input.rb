class Input
    attr_accessor :num_vertexes, :start_node, :end_node,
                  :nodes
    def initialize (input_file_path)
        #[source, [destination, weight]]
        @nodes = Hash.new{ |h,k| h[k] = Array.new(&h.default_proc) }

        begin
            file = File.new(input_file_path, 'r')

            @num_vertexes = file.gets.to_i
            l = file.gets
            @start_node = l.split(' ')[0].to_i-1
            @end_node = l.split(' ')[1].to_i-1

            while (line = file.gets)
                s = line.split(' ')[0].to_i
                d = line.split(' ')[1].to_i
                w = line.split(' ')[2].to_i
                @nodes[s-1][d-1]= w
            end

            file.close
        rescue => err
            puts "Erro ao abrir arquivo: #{err}"
            err
        end
        num_vertexes.times {|i| num_vertexes.times {|j| if nodes[i][j].nil? then nodes[i][j]=0 end } }
    end
end