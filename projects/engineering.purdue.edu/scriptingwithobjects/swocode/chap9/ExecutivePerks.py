class ExecutivePerks:                                               #(X1)

    _bonus = 0                                                      #(X2)

    def get_bonus(): return ExecutivePerks._bonus                   #(X3)
    get_bonus = staticmethod( get_bonus )                           #(X4)
    
    def set_bonus(bonus): ExecutivePerks._bonus = bonus             #(X5)
    set_bonus = staticmethod( set_bonus )                           #(X6)
