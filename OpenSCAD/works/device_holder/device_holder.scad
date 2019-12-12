echo(version=version());
$fn=60;

baseH = 3;
baseL = 140;
baseL2 = 80;
baseW = 60;
sepH = 30;
sepM = 20;

difference() {
	union(){
		// base
		cube([baseL,baseW,baseH]);
		// separater
		for (x = [0 : sepM : baseL])
		{
			translate([x, 0, 0]) sep();
		}
	}
	defcyl();
	translate([baseL, baseW/3 + 0.5, 0]) cube([baseH,baseW/3 - 1,sepH]);
}

*difference() {
	union(){
		// base2
		translate([baseL, 0, 0]) cube([baseL2,baseW,baseH]);
		// separater2
		for (x = [baseL : sepM : baseL + baseL2])
		{
			translate([x, 0, 0]) sep();
		}
	}
	defcyl();
	translate([baseL, 0, 0]) cube([baseH,baseW/3,sepH]);
	translate([baseL, baseW/3*2, 0]) cube([baseH,baseW/3,sepH]);
}

module sep() {
	cube([baseH,baseW,sepH]);
}

module defcyl(){
	translate([-10, baseW/2, baseW/4 + sepH/2]) rotate([0, 90, 0]) cylinder(h=baseL + baseL2 + 20, r=(baseW/3));
}
