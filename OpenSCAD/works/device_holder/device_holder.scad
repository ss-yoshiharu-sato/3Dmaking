echo(version=version());
$fn=60;

baseH = 3;
baseL = 80;
baseW = 80;
sepH = 30;
sepM = 20;

// base
cube([baseL,baseW,baseH]);
// separater
for (x = [0 : sepM : baseL])
{
    translate([x, 0, 0]) sep();
}

module sep() {
    cube([baseH,baseW,sepH]);
}
