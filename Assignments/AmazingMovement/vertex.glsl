#version 330

layout (location = 0) in vec3 in_Position;
layout (location = 1) in vec3 in_Color;

layout (location = 2) in vec3 vPos;
layout (location = 3) in vec3 vNormal;

out vec3 out_Color;

out vec3 FragPos; //--- 객체의 위치값을 프래그먼트 세이더로 보낸다.
out vec3 Normal; //--- 노멀값을 프래그먼트 세이더로 보낸다.

uniform mat4 modelTransform;
uniform mat4 viewTransform;
uniform mat4 projectionTransform;

void main()
{
	gl_Position = projectionTransform * viewTransform * modelTransform * vec4 (in_Position.x, in_Position.y, in_Position.z, 1.0);


	out_Color = in_Color;

	FragPos = vec3(modelTransform * vec4(vPos, 1.0)); //--- 객체에 대한 조명 계산을 프래그먼트 셰이더에서 한다. 
	//--- 따라서 월드공간에 있는 버텍스 값을 프래그먼트 셰이더로 보낸다.
	Normal = vNormal; //--- 노멀값을 프래그먼트 세이더로 보낸다.
}