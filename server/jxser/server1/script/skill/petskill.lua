
--��������,���ڼ��㼼��������
--���巽����
--����1��������,�������ٶ�,����,�ظ��˺�����,��Χ,�������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range
function SkillExpFunc(Exp0,a,Level,Time,Range)
	return floor(Exp0*(a^(Level-1))*Time*Range/2)
end


SKILLS={
	--���＼��
	pu_su={ --����
		sorbdamage_yan_p=
		{
		[1]={{1,10},{2,15},{3,20},{4,25},{5,30}},
		[2]={{1,-1},{5,-1}},
		}
	},
	ying_yong={ --Ӣ��
		anti_sorbdamage_yan_p=
		{
		[1]={{1,10},{2,15},{3,20},{4,25},{5,30}},
		[2]={{1,-1},{5,-1}},
		}
	},
	qiang_gong={ --ǿ��
		skill_enhance=
		{
		[1]={{1,20},{2,40},{3,60},{4,80},{5,100}},
		[2]={{1,-1},{5,-1}},
		}
	},
	jing_zhun={ --��׼
		do_hurt_p=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	gang_ying={ --��Ӳ
		anti_do_hurt_p=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	chuan_ci={ --����
		anti_hitrecover=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	zhi_mi={ --����
		fasthitrecover_yan_v=
		{
		[1]={{1,2},{2,4},{3,6},{4,8},{5,10},{10,20}},
		[2]={{1,-1},{10,-1}},
		}
	},
	yuan_run={ --Բ��
		block_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10}},
		[2]={{1,-1},{10,-1}},
		}
	},
	jian_qiang={ --��ǿ
		anti_block_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10}},
		[2]={{1,-1},{10,-1}},
		}
	},
	duan_lie={ --����
		enhancehit_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10}},
		[2]={{1,-1},{10,-1}},
		}
	},
	wen_gu={ --�ȹ�
		anti_enhancehit_rate=
		{
		[1]={{1,1},{2,2},{3,3},{4,4},{5,5},{10,10}},
		[2]={{1,-1},{10,-1}},
		}
	},
	shan_guang={ --����
		lifemax_yan_v=
		{
		[1]={{1,1000},{2,1400},{3,1800},{4,2200},{5,2600},{10,4600}},
		[2]={{1,-1},{10,-1}},
		}
	},
	fu_guang={ --����
		manamax_yan_v=
		{
		[1]={{1,700},{2,900},{3,1100},{4,1300},{5,1500},{10,2500}},
		[2]={{1,-1},{10,-1}},
		}
	},
	jian_ren={ --����
		physicsres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50}},
		[2]={{1,-1},{10,-1}},
		}
	},
	gao_neng={ --����
		fireres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50}},
		[2]={{1,-1},{10,-1}},
		}
	},
	qing_ying={ --��ӯ
		coldres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50}},
		[2]={{1,-1},{10,-1}},
		}
	},
	fu_shu={ --����
		poisonres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50}},
		[2]={{1,-1},{10,-1}},
		}
	},
	chun_jing={ --����
		lightingres_yan_p=
		{
		[1]={{1,5},{2,10},{3,15},{4,20},{5,25},{10,50}},
		[2]={{1,-1},{10,-1}},
		}
	},
}
-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--����2����,�����κ���f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--��x2=x1, ��x=c,��ֱ����һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--���,�����֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--����2����,��2���κ���f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--��x1����x2 < 0 ,y =0
--��x2=x1, ��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--���,�����֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--����2����,��-2���κ���f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--��x2����x1<0, y=0,
--��x1=x2,��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--���,�����֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--���������:Link(x,points)
--����points�ṩ��һϵ�е�,�����ڵ��������������
--return yֵ
--x ����ֵ
--points �㼯��
--���磺points������{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}��ӳ��
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end

------------------------------------------------------
--�����趨��ʽ���£�
--SKILLS={
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[2]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[3]={{����,��ֵ,����},{����,��ֵ,����},��������},	
--		},
--		ħ������=	{
--			[1]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[2]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[3]={{����,��ֵ,����},{����,��ֵ,����},��������},	
--		},
--		����������
--	},
--	��������=	{
--		ħ������=	{
--			[1]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[2]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[3]={{����,��ֵ,����},{����,��ֵ,����},��������},	
--		},
--		ħ������=	{
--			[1]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[2]={{����,��ֵ,����},{����,��ֵ,����},��������},
--			[3]={{����,��ֵ,����},{����,��ֵ,����},��������},	
--		},
--		����������
--	},
--	����������
--}
--�磺
--SKILLS={
--	Sanhuan-taoyue={
--		physicsenhance_p={
--			[1]={{1,50},{20,335}},--ħ������physicsenhance_p����1,1��ʱΪ35,20��ʱΪ335,���߲���,Ĭ������
--			[2]={{1,0},{20,0}},
--		},--û��[3],��ʾħ������physicsenhance_p����2,Ĭ��Ϊ�κ�ʱ����0
--		lightingdamage_v={
--			[1]={{1,65},{20,350}},
--			[3]={{1,65},{20,350}},
--		}
--	}
--}
--�����������ܡ��������¡���ħ�����Ժ���ֵ
-----------------------------------------------------------
--����GetSkillLevelData(levelname, data, level)
--levelname��ħ����������
--data����������
--level�����ܵȼ�
--return������������Ϊdata,���ܵȼ�Ϊlevel
--			ʱ��ħ������levelname����������������ľ���ֵ
-----------------------------------------------------------
function GetSkillLevelData(levelname, data, level)
	if(data==nil) then
		return ""
	end
	if(data == "") then
		return ""
	end
	if(SKILLS[data]==nil) then
		return ""
	end
	if(SKILLS[data][levelname]==nil) then
		return ""
	end
	if(type(SKILLS[data][levelname]) == "function") then
		return SKILLS[data][levelname](level)
	end
	if(SKILLS[data][levelname][1]==nil) then
		SKILLS[data][levelname][1]={{0,0},{5,0}}
	end
	if(SKILLS[data][levelname][2]==nil) then
		SKILLS[data][levelname][2]={{0,0},{5,0}}
	end
	if(SKILLS[data][levelname][3]==nil) then
		SKILLS[data][levelname][3]={{0,0},{5,0}}
	end
	p1=floor(Link(level,SKILLS[data][levelname][1]))
	p2=floor(Link(level,SKILLS[data][levelname][2]))
	p3=floor(Link(level,SKILLS[data][levelname][3]))
	return Param2String(p1,p2,p3)
end;


function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;
