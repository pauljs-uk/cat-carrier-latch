include <BOSL2/std.scad>

barrelPart1Height=1.8;
barrelPart2Height=10.5;
barrelPart3Height=10.0;

barrelPart1Radius=12.0/2;
barrelPart2Radius=10.8/2;
barrelPart3Radius=14/2;

facets=72;

module barrelPart(s=1) { 
  cyl(
    l=barrelPart1Height*s,
    r=barrelPart1Radius*s,
    center=false,
    chamfer=0.6*s,
    $fn=facets
  );
  
  translate(
    [0,0,barrelPart1Height*s]
  )
  cyl(
    l=barrelPart2Height*s,
    r=barrelPart2Radius*s,
    center=false,
    $fn=facets
  );
  
  translate(
    [0,0,(barrelPart1Height+barrelPart2Height)*s]
  )
  cyl(
    l=barrelPart3Height*s, 
    r=barrelPart3Radius*s, 
    center=false, 
    rounding2=2*s, 
    $fn=facets
  );
}

module slotPart1(s=1) {
  cuboid(
    [4.8*s,12*s,15.5*s],
    p1=[-2.4,-2.4,-3.2],
    rounding=2.4*s,
    edges=[
      TOP+FRONT,
      TOP+LEFT,
      TOP+RIGHT,
      FRONT+RIGHT,
      FRONT+LEFT
    ], 
    $fn=facets
  );
}

module slotPart2(s=1) { 
  cuboid(
    [2.6*s,8*s,10*s], 
    p1=[-1.3,-8,-3.2], 
    rounding=1.1*s, 
    $fn=facets
  );
}

module slotPart3(s=1) { 
  cuboid(
    [0.8*s,8*s,15.5*s], 
    p1=[-0.4,-8,-3.2], 
    rounding=0.1*s, 
    $fn=facets
  );
}

module removeSlotPart() {
  difference() {
    barrelPart();
    slotPart1();
    slotPart2();
    slotPart3();
  };  
}
 
module leverPart(s=1) {
  cuboid(
    [4.2*s,10*s,4*s], 
    p1=[-2.1,0,(barrelPart1Height+barrelPart2Height)]
  );
  
  cuboid(
    [4.2*s,22*s,8*s], 
    p1=[-2.1,0,(barrelPart1Height+barrelPart2Height+2)], 
    rounding=1.2*s,
    edges=[
      TOP+BACK,
      TOP+LEFT,
      TOP+RIGHT,
      BACK+RIGHT,
      BACK+LEFT,
      BOTTOM+BACK,
      BOTTOM+LEFT,
      BOTTOM+RIGHT
    ], 
    $fn=facets
  );
}

module main() {
  removeSlotPart();
  leverPart();
}
 
main();