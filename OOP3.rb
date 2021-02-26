module Action #Create module Action
    def start
        puts "#{self.class}  is  starting "      
    end

    def stop
        puts "#{self.class}  has stopped"
    end
end


module ActionBroke      #Create module ActionBroke in case vehicles is broke 
    def start
        puts "Please fix vehicle before starting"
    end 
    
    def stop 
        puts "Vehicle already stop because it's broke"
    end
end


class Vehicles                                              #Create Vehicles class
    attr_reader :name                                       #Only read name
    attr_reader :belong                                     #Only read                                
    attr_accessor :status 
    def initialize(name  , belong ,status) #Initialize vehicles with name  and belong to which transport and status of vehicles
        @name   = name
        @belong = belong
        @status = status
        if @status == "broke"
            (class <<self; include ActionBroke; end)
        else
            (class <<self; include Action; end)
        end

    end

    def call                                                #Infomation about attribute of vehicles
        "#{self.name} , i'm #{self.belong} vehicle and i'm #{self.status}"      
    end
    
    def moveby      #How vehicles move 
        "I move by "
    end
end


class Cars < Vehicles                                               #Create Cars is inherited from Vehicles 
    def call                                                        #Override attribute infomation 
        "I'm car " + super                                
    end

    def moveby    
        super + "wheeling"
    end
end


class Planes < Vehicles                                             #Same as Cars 
    def call 
        "I'm plane" + super
    end

    def moveby      
        super + "flying"
    end
end


class Submarines < Vehicles                                          #Same as Cars
    def call 
        "I'm submarine"  + super
    end


    def moveby      
        super + "diving"
    end
end


C1 = Cars.new("Lightning McQueen" ,"road","broke") #Create instance of Cars 
C1.call     #Access and display vehiles attribute
C1.stop     #Call method stop 
C1.start		
C1.moveby   #Display how vehicles move

P1 = Planes.new("Boeing 777"  ,"airway","normal")
P1.call     #Access and display vehiles attribute
P1.stop     #Call method stop 
P1.start		
P1.moveby   #Display how vehicles move


