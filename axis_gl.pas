unit axis_gl;

{$Mode ObjFpc}

interface

uses
	PM_Colour,
	math,
	Gl;

procedure DrawLine(sX, sY, eX, eY: Int64; Clr: Colour; Wi
procedure DrawBorder(sX


, sY, eX, eY: Int64; Clr: Colour; Width: Int64);
procedure DrawArc(cX, cY, radius: Int64; StartAngle, ArcAngle: Real; Clr: Colour; Width: Int64);
procedure DrawPoint(pX, pY: Int64; Clr: Colour; Size: Int64);
procedure DrawSector(cX, cY, Radius: Int64; StartAngle, ArcAngle: Real; Clr: Colour);

const
	AXIS_GL_ARC_Segments	:	Int64	=	80;

implementation

procedure DrawSector(cX, cY, Radius: Int64; StartAngle, ArcAngle: Real; Clr: Colour);
var
	ca: Real;
	sa, ea: Real;
	sega: Real;
	
begin
	//DrawLine(cX - 5, cY - 5, cX + 5, cY + 5, Clr, 1);
	sa := (StartAngle / 180) * pi;
	ea := ((ArcAngle + StartAngle) / 180) * pi;
	sega := ( (ArcAngle / AXIS_GL_ARC_Segments) / 180) * pi;
	

	glDisable(GL_TEXTURE_2D);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); 
	glLineWidth(1);
	glColorPM(Clr);
	glBegin(GL_Triangle_Fan);
	glVertex2f(cX, cY);
	ca := sa - sega;
	repeat
		ca += sega;
		
		glVertex2f((radius * sin(ca)) + cX, cY - (radius * cos(ca)));
		until ca >= ea;

	glEnd();
	glDisable(GL_BLEND);
    glEnable(GL_TEXTURE_2D);
end;

procedure DrawPoint(pX, pY: Int64; Clr: Colour; Size: Int64);
begin
	glDisable(GL_TEXTURE_2D);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); 

	glPointSize(Size);
	glColorPM(Clr);
	glBegin(Gl_Points);
		glVertex3f(pX, pY, 0);
	glEnd();
	
	glDisable(GL_BLEND);
    glEnable(GL_TEXTURE_2D);
end;

procedure DrawArc(cX, cY, radius: Int64; StartAngle, ArcAngle: Real; Clr: Colour; Width: Int64);
var
	ca: Real;
	sa, ea: Real;
	sega: Real;
	
begin
	//DrawLine(cX - 5, cY - 5, cX + 5, cY + 5, Clr, 1);
	sa := (StartAngle / 180) * pi;
	ea := ((ArcAngle + StartAngle) / 180) * pi;
	sega := ( (ArcAngle / AXIS_GL_ARC_Segments) / 180) * pi;
	

	glDisable(GL_TEXTURE_2D);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); 
	glLineWidth(Width);
	glColorPM(Clr);
	glBegin(GL_LINE_STRIP);

	ca := sa - sega;
	repeat
		ca += sega;
		
		glVertex2f((radius * sin(ca)) + cX, cY - (radius * cos(ca)));
		until ca >= ea;

	glEnd();
	glDisable(GL_BLEND);
    glEnable(GL_TEXTURE_2D);
end;

procedure DrawBorder(sX, sY, eX, eY: Int64; Clr: Colour; Width: Int64);
begin
	DrawLine(sX, sY, eX, sY, Clr, Width);
	DrawLine(sX, eY, eX, eY, Clr, Width);
	DrawLine(sX, sY, sX, eY, Clr, Width);
	DrawLine(eX, sY, eX, eY, Clr, Width);
end;

procedure DrawRectangle(sX, sY, eX, eY: Int64; Clr: Colour);
begin
	glDisable(GL_TEXTURE_2D);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); 
	glColorPM(Clr);
	glBegin(GL_QUADS);
		glVertex3f(sX, sY, 0);
		glVertex3f(sX, eY, 0);
		glVertex3f(eX, eY, 0);
		glVertex3f(eX, sY, 0);
	glEnd();
	glDisable(GL_BLEND);
    glEnable(GL_TEXTURE_2D);
end;

procedure DrawLine(sX, sY, eX, eY: Int64; Clr: Colour; Width: Int64);
begin
	glDisable(GL_TEXTURE_2D);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); 
	glLineWidth(Width);
	glColorPM(Clr);
	glBegin(GL_LINES);
		glVertex3f(sX, sY, 0);
		glVertex3f(eX, eY, 0);
	glEnd();
	glDisable(GL_BLEND);
    glEnable(GL_TEXTURE_2D);
end;

begin
end.
