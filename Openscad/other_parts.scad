/* BandMate Project, other_parts.scad
 * other_parts.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

include <settings.scad>

bearing(hole_radius=5, radius=15,width=9);

/* Two metal rods. */
module rods(length=300)
{
	translate([0,20,0]) rotate([0,90,0]) cylinder(r=4, h=length);
	translate([0,-20,0]) rotate([0,90,0]) cylinder(r=4, h=length);
}

/* Belt. */
module belt(radius,length)
{
	difference()
	{
	hull()
	{
		translate([length,0,0]) cylinder(r=radius+2,h=5,center=true);
		translate([0,0,0]) cylinder(r=radius+2,h=5,center=true);
	}
	hull()
	{
		translate([length,0,0]) cylinder(r=radius,h=7,center=true);
		translate([0,0,0]) cylinder(r=radius,h=7,center=true);
	}
	}
}

/* Hexnut. */
module hexnut(width,height)
{
	translate([0,0,height/2]) rotate([0,0,0]) cube([width,tan(30)*width,height],center=true);
	translate([0,0,height/2]) rotate([0,0,60]) cube([width,tan(30)*width,height],center=true);
	translate([0,0,height/2]) rotate([0,0,120]) cube([width,tan(30)*width,height],center=true);

}

/* Flat metal bar under the string. */
module bar()
{
	translate([bar_length/2+30,0,bar_height/2]) cube([bar_length,bar_width,bar_height],center=true);
}

module bearing(hole_radius=8.5, radius=20,width=12)
{	
	//translate([0,0,radius+3])
	rotate([90,0,0]) 
	difference()
	{
		cylinder(r=radius, h=width,center=true);
		cylinder(r=hole_radius, h=width*1.1,center=true);
	}
}
