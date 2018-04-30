<div class="form-group">
	<label for="position" class="cols-sm-2 control-label">Job Position</label>
	<div class="cols-sm-10">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-briefcase fa-lg" aria-hidden="true"></i></span>
			<select class="form-control" id="jobpostcheck" name="jobposition">
				<option value="">Choose an option...</option>
				<?php 
					$job = DB::select("CALL WAF_Read_Position()");
					foreach ($job as $key => $value) {
						echo '<option value="'.$value->UserJobPosID.'">'.$value->UserJobName.'</option>';
					}
				?>							
			</select>

		</div>
	</div>
</div>
