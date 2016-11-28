#-----------------  Class Worker in file Worker.py  --------------------
class Worker:                                                      #(W1)
    def __init__( self, a_name, a_position ):                      #(W2)
        self.name = a_name                                      
        self.position = a_position                              

    def get_position( self ):                                      #(W3)
        return self.position

    def set_position( self, new_position ):                        #(W4)
        self.position = new_position

    promotion_table = {                                            #(W5)
        'shop_floor'  : 'team_leader',
        'team_leader' : 'group_lead',
        'group_lead'  : 'foreman',
        'foreman'     : 'manager'
    }

    def promote( self ):                                           #(W6)
        self.position = Worker.promotion_table[ self.position ]

    def myprint( self ):                                           #(W7)
        print "Name:", self.name, " Position:", self.position,
