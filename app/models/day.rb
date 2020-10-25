class Day < ActiveHash::Base
  self.data = [ 
    {id: 1, day: '支払い後、1~2日で発送'}, {id: 2, day: '支払い後、2~3日で発送'}, {id: 3, day: '支払い後、4~7日で発送'}
  ]
end