include <MCAD/regular_shapes.scad>;

module roundedCube(edgeLength, roundedRadius, detail)
{
    edgeSegmentLength = edgeLength - roundedRadius * 2;
    translate(v = [edgeLength / 2, edgeLength / 2, edgeLength / 2])
    union()
    {
        translate(v = [edgeSegmentLength / -2, edgeSegmentLength / -2, edgeSegmentLength / -2])
            cube(size = [edgeSegmentLength, edgeSegmentLength, edgeSegmentLength]);
        for (angle = [0 : 90 : 270 ])
        {
            rotate(a = [0, 0, angle])
                union()
                {
                    translate(v = [edgeSegmentLength / -2, edgeSegmentLength / -2, edgeSegmentLength / -2])
                        sphere(r = roundedRadius, $fn = detail);
                    translate(v = [edgeSegmentLength / -2, edgeSegmentLength / -2, edgeSegmentLength / 2])
                        sphere(r = roundedRadius, $fn = detail);
                    translate(v = [edgeSegmentLength / -2, edgeSegmentLength / -2, edgeSegmentLength / -2])
                        cylinder(r = roundedRadius, h = edgeSegmentLength, $fn = detail);
                    translate(v = [edgeSegmentLength / -2, edgeSegmentLength / -2, edgeSegmentLength / 2])
                        rotate(a = [0, 90, 0])
                            cylinder(r = roundedRadius, h = edgeSegmentLength, $fn = detail);
                    translate(v = [edgeSegmentLength / -2, edgeSegmentLength / -2, edgeSegmentLength / -2])
                        rotate(a = [0, 90, 0])
                            cylinder(r = roundedRadius, h = edgeSegmentLength, $fn = detail);
                    translate(v = [edgeSegmentLength / -2 - 0.1, edgeSegmentLength / -2 - roundedRadius, edgeSegmentLength / -2 - 0.1])
                        cube(size = [edgeSegmentLength + 0.2, roundedRadius + 1, edgeSegmentLength + 0.2]);
                }
        }
        translate(v = [edgeSegmentLength / -2 - 0.1, edgeSegmentLength / -2 - 0.1, edgeSegmentLength / 2 - 1])
            cube(size = [edgeSegmentLength + 0.2, edgeSegmentLength + 0.2, roundedRadius + 1]);
        translate(v = [edgeSegmentLength / -2 - 0.1, edgeSegmentLength / -2 - 0.1, edgeSegmentLength / -2 - roundedRadius])
            cube(size = [edgeSegmentLength + 0.2, edgeSegmentLength + 0.2, roundedRadius + 1]);
    }
}

difference()
{
    // Base cube
    translate(v = [-20, -20, 0])
        roundedCube(40, 5, 60);
    // Square
    translate(v = [-13, -21, (40 - 26) / 2])
        cube(size = [26, 4, 26]);
    // Plus sign
    translate(v = [17, -13, (40 - 10) / 2])
        cube(size = [4, 26, 10]);
    translate(v = [17, -5, (40 - 26) / 2])
        cube(size = [4, 10, 26]);
    // Triangle
    translate(v = [0, 20 + 1, 13 * sqrt(3) / 2])
        rotate(a = [90, 0, 0])
            translate(v = [0, 13 / 2, 0])
                linear_extrude(height = 4, convexity = 10)
                    triangle(radius = 13);
    // Circle
    translate(v = [-21, 0, 20])
        rotate(a = [0, 90, 0])
            cylinder(h = 4, r = 13, $fn = 60);
    // Star
    translate(v = [-14, 14, 40 - 3])
        linear_extrude(height = 4, convexity = 10)
            scale(v = [70, 70, 1])
                import(file = "star.dxf");
    
}
