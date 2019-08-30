# Script to show skills that noone has learned yet
select skill.Name, ifnull(person.Name,''), ifnull(skillLev.Level,0)
	from castle.skill_level as skillLev 
	inner join castle.person as person
	right join castle.skill as skill 
    on skillLev.Person = person.idPerson and skillLev.Skill = skill.idSkill
    where person.Name is null
# Uncomment this to see skills before level 10 as well
#    or skillLev.Level < 10