//Debug
////threadUnit(d,pitch,th,tw,minw,sw=0)
//threadUnit(27.5,3.5,1.7,1.5,0.1,sw=0);
//threadUnit(27.5,3.5,1.7,1.5,1,sw=1);
//thread(d,loopn,pitch,th,tw,minw,sw=0)
//mirror([0,0,1])
//thread(27.5,2,3.5,1.6,1.5,1,1);
//thread_test(27.5,2,3.5,1.6,1.5,2,0);

module threadUnit(d,pitch,th,tw,minw,sw=0){
	ang_step1=atan(minw/d);
	ang_step=2*ang_step1;
	tmpR=sqrt(0.5*d*0.5*d+0.5*minw*0.5*minw);
	x1=(0.5*d-th);
	tmpR1=x1/cos(ang_step1);
	y1=tmpR1*sin(ang_step1);
	y2=tmpR*sin(ang_step1);
	//x45=0.5*d-th*cos(45);
	x45=th*cos(45);
	r45=(0.5*d-th*cos(45))/cos(ang_step1);
	y45=r45*sin(ang_step1);
	//y45_2=r45*sin(ang_step1);
	z45=0.5*th*sin(45);
	stepN=floor(360/ang_step);
	Hstep=pitch/stepN;
	
	if(sw){
		threadUnitOut(d,pitch,th,tw,minw);
	}else{
		polyhedron(points = [[0,-y2,-tw/2-Hstep/2],[0,-y2,tw/2-Hstep/2],[-x45,-y45,z45-Hstep/2],[-th,-y1,-Hstep/2], [-x45,-y45,-z45-Hstep/2], [0,y2,-tw/2+Hstep/2],[0,y2,tw/2+Hstep/2],[-x45,y45,z45+Hstep/2],[-th,y1,Hstep/2], [-x45,y45,-z45+Hstep/2]], faces = [ [0,4,3,2,1], [5,6,7,8,9],[0,1,6,5],[1,2,7,6],[2,3,8,7],[3,4,9,8],[4,0,5,9]]);
	}
}
module threadUnitOut(d,pitch,th,tw,minw){
	ang_step1=atan(minw/d);
	ang_step=2*ang_step1;
	tmpIniR=0.5*d+th;
	tmpR=sqrt(tmpIniR*tmpIniR+0.5*minw*0.5*minw);
	x1=0.5*d;
	tmpR1=x1/cos(ang_step1);
	y1=tmpR1*sin(ang_step1);
	y2=tmpR*sin(ang_step1);
	x45=th*cos(45);
	r45=(x45+0.5*d)/cos(ang_step1);
	y45=r45*sin(ang_step1);
	//echo(y45);
	z45=0.5*th*sin(45);
	stepN=floor(360/ang_step);
	Hstep=pitch/stepN;
	polyhedron(points = [[0,-y1,-tw/2-Hstep/2],[0,-y1,tw/2-Hstep/2],[x45,-y45,z45-Hstep/2],[th,-y2,-Hstep/2], [x45,-y45,-z45-Hstep/25], [0,y1,-tw/2+Hstep/2],[0,y1,tw/2+Hstep/2],[x45,y45,z45+Hstep/2],[th,y2,Hstep/2], [x45,y45,-z45+Hstep/2]], faces = [ [0,1,2,3,4], [9,8,7,6,5],[5,6,1,0],[6,7,2,1],[7,8,3,2],[8,9,4,3],[9,5,0,4]]);

}

module thread(d,loopn,pitch,th,tw,minw,sw=0){
	ang_step1=atan(minw/d);
	ang_step=2*ang_step1;
	angN=floor(360/ang_step);
	Hstep=pitch/angN;

	union(){
		for(j=[0:loopn-1]){
			union(){
				for(i=[0:angN]){
					translate([0.5*d*cos(i*ang_step),0.5*d*sin(i*ang_step),i*Hstep+j*pitch])
					rotate([0,0,i*ang_step])
					threadUnit(d,pitch,th,tw,minw,sw);
				}
			}
		}
	}
}
