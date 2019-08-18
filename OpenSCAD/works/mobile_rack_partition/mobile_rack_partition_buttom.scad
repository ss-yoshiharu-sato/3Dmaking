echo(version=version());

// 4 * 2 = 8
// 4 * 10 = 40
// 5 set

terminal=true;

defH=10;
defW=10;
defD=2;
defM=20;
defBD=2;

* difference(){
    union(){

        cube([defW, defD, defH]);
        translate([0, defD + defBD, 0]) cube([defW, defD, defH]);

        translate([0, defM + defD, 0]) {
        cube([defW, defD, defH]);
        translate([0, defD + defBD, 0]) cube([defW, defD, defH]);
        }

        translate([0, 0, -defD]) cube([defW, defM + (defD + defBD) * 2, defD]);
    }
    if (terminal)
    {
        translate([0, 0, -defD]) cube([defW, defD+defBD, defH+defD]);
    }
}

difference(){
    union(){
        translate([0, 0, 0]) block();
        translate([11, 0, 0]) block();
        translate([22, 0, 0]) block();
        translate([33, 0, 0]) block();
        translate([44, 0, 0]) block();
    }
    translate([54, -4.5, -1]) cube([2, 28, 45]);
}



module block(){
    union(){
        cube([10, 1, 42]);
        cube([10, 18, 1]);
        translate([0, 18, 0]) cube([10, 1, 42]);
        translate([0, 18, 42]) cube([10, 4, 1]);
        translate([0, -3, 42]) cube([10, 4, 1]);
        translate([0, 21, 32]) cube([10, 1, 10]);
        translate([0, -3, 32]) cube([10, 1, 10]);
    }
    *translate([10, 0.3, 0]) {
        cube([1, 0.3, 42]);
        cube([1, 18, 0.3]);
        translate([0, 18, 0]) cube([1, 0.3, 42]);
        translate([0, 18, 42]) cube([1, 3.3, 0.3]);
        translate([0, -3, 42]) cube([1, 3.3, 0.3]);
        translate([0, 21, 32]) cube([1, 0.3, 10]);
        translate([0, -3, 32]) cube([1, 0.3, 10]);
    }
}
