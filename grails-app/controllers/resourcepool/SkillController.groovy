package resourcepool

import org.springframework.security.access.annotation.Secured

@Secured('permitAll')
class SkillController {

    def index() {

        def skillList = Skill.list()

        [skillList:skillList]
    }

    def addForm(){

    }

    def save(){

        def skillInstance = new Skill(params)

        if (skillInstance.save()){
            redirect(action: 'index')
        }
    }

    def edit(){
        def skill = Skill.get(params.skill_id)?.skillName
        [skillName:skill,id:params.skill_id]
    }

    def update() {
        def skill = Skill.get(params.skill_id)
        skill.properties=params
        if(skill.save(flush: true,failOnError: true)){
            redirect(action: 'index')
        }
    }

    def delete(){
        def skill = Skill.get(params.skill_id)
        skill.delete(flush: true,failOnError:true)
        redirect(action: 'index')
    }

}