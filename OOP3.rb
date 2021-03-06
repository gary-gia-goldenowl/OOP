module Action #Create module Action
    def start
        " is starting"
    end

    def stop
         " has stopped"
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
        if @status != "broke"
            self.class.include(Action)
        else
            def start
                "cannot start because it's broken"
            end
    
            def stop
                "already stop because it's broken"
            end
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
    
    def start
        "Car " + super
    end
 
    def stop
        "Car " +super 
    end
end


class Planes < Vehicles                                             #Same as Cars 
    def call 
        "I'm plane" + super
    end

    def moveby      
        super + "flying"
    end

    def start
        "Plane " + super
    end
 
    def stop
        "Plane " +super 
    end
end


class Submarines < Vehicles                                          #Same as Cars
    def call 
        "I'm submarine"  + super
    end

    def moveby      
        super + "diving"
    end

    def start
        "Submarine " + super
    end
 
    def stop
        "Submarine " + super 
    end
end


C1 = Cars.new("Lightning McQueen" ,"road","broke") #Create instance of Cars 
C1.call     #Access and display vehiles attribute
C1.start
C1.stop     #Call method stop 		
C1.moveby   #Display how vehicles move

P1 = Planes.new("Boeing 777"  ,"airway","good to go")
P1.call     #Access and display vehiles attribute
P1.start     #Call method stop 
P1.stop		
P1.moveby   #Display how vehicles move
