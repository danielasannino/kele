module Roadmap
    def get_roadmap(roadmap_id)
        response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @user_auth_token })
        @roadmap = JSON.parse(response.body)
    end

    def get_checkpoint(checkpoint_id)
        response = self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @user_auth_token })
        @checkpoint = JSON.parse(response.body)
    end

    def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
        @enrollment_id = self.get_me['id']
        response = self.class.post("/checkpoint_submissions", headers: { "authorization" => @user_auth_token }, body: {
            checkpoint_id: checkpoint_id,
            enrollment_id: @enrollment_id,
            assignment_branch: assignment_branch,
            assignment_commit_link: assignment_commit_link,
            comment: comment
        })
    end
end
