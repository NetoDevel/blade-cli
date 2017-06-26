class Run

    def load_dependencies 
        system('mvn -o dependency:list -DoutputFile="list-dependencies.txt" -DoutputAbsoluteArtifactFilename=true')
        dependencies = ""
        File.open('list-dependencies.txt', 'r') do |f1|
            while line = f1.gets
                path_dependency = line.split(':/')
                unless (path_dependency[1].to_s.empty?)
                    dependencies +=  ":/" + path_dependency[1].strip
                end
            end
        end
        path_build = Dir.pwd + "/target/classes"
        command = "java -Dfile.encoding=UTF-8 -classpath #{path_build}#{dependencies} com.example.myapp.Application"
        puts command
        system(command)
    end
    
end

run = Run.new
run.load_dependencies