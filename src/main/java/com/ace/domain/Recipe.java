package com.ace.domain;

public class Recipe {

	//tb_recipe 테이블
	private int r_idx;
	private int r_data_idx;
	private String r_group;
	private String r_name;
	private String r_comment;
	private String r_createtime;
	private String r_updatetime;
	private String r_yn;
	
	//tb_recipe_data 테이블
	private int r_f_idx;
	private int r_f_data_idx;
	private short segment;
	private short process_step;
	private short time;
	private short temper;
	private short temper_tolerance_cont;
	private short temper_tolerance_hold;
	private short holdback_timeout_heating;
	private short pressure_set_value;
	private short pressing_capacity_f1;
	private short pressing_capacity_f2;
	private short forece_tolerance;
	private short position_abs;
	private short position_relative;
	private short distance_tolerance;
	private short holding_time1;
	private short holding_time2;
	private short number_of_loops;
	private short speed_of_plunger;
	private short gradient_of_force;
	private short fastcooling;
	private short gas_n2;
	private short gas_ar;
	private short spare;
	private short hydraulic_unit_off;
	private short press_capacity_control;
	private short press_position_control;
	private short press_distance_control;
	
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public int getR_data_idx() {
		return r_data_idx;
	}
	public void setR_data_idx(int r_data_idx) {
		this.r_data_idx = r_data_idx;
	}
	public String getR_group() {
		return r_group;
	}
	public void setR_group(String r_group) {
		this.r_group = r_group;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_comment() {
		return r_comment;
	}
	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}
	public String getR_createtime() {
		return r_createtime;
	}
	public void setR_createtime(String r_createtime) {
		this.r_createtime = r_createtime;
	}
	public String getR_updatetime() {
		return r_updatetime;
	}
	public void setR_updatetime(String r_updatetime) {
		this.r_updatetime = r_updatetime;
	}
	public String getR_yn() {
		return r_yn;
	}
	public void setR_yn(String r_yn) {
		this.r_yn = r_yn;
	}
	public int getR_f_idx() {
		return r_f_idx;
	}
	public void setR_f_idx(int r_f_idx) {
		this.r_f_idx = r_f_idx;
	}
	public int getR_f_data_idx() {
		return r_f_data_idx;
	}
	public void setR_f_data_idx(int r_f_data_idx) {
		this.r_f_data_idx = r_f_data_idx;
	}
	public short getSegment() {
		return segment;
	}
	public void setSegment(short segment) {
		this.segment = segment;
	}
	public short getProcess_step() {
		return process_step;
	}
	public void setProcess_step(short process_step) {
		this.process_step = process_step;
	}
	public short getTime() {
		return time;
	}
	public void setTime(short time) {
		this.time = time;
	}
	public short getTemper() {
		return temper;
	}
	public void setTemper(short temper) {
		this.temper = temper;
	}
	public short getTemper_tolerance_cont() {
		return temper_tolerance_cont;
	}
	public void setTemper_tolerance_cont(short temper_tolerance_cont) {
		this.temper_tolerance_cont = temper_tolerance_cont;
	}
	public short getTemper_tolerance_hold() {
		return temper_tolerance_hold;
	}
	public void setTemper_tolerance_hold(short temper_tolerance_hold) {
		this.temper_tolerance_hold = temper_tolerance_hold;
	}
	public short getHoldback_timeout_heating() {
		return holdback_timeout_heating;
	}
	public void setHoldback_timeout_heating(short holdback_timeout_heating) {
		this.holdback_timeout_heating = holdback_timeout_heating;
	}
	public short getPressure_set_value() {
		return pressure_set_value;
	}
	public void setPressure_set_value(short pressure_set_value) {
		this.pressure_set_value = pressure_set_value;
	}
	public short getPressing_capacity_f1() {
		return pressing_capacity_f1;
	}
	public void setPressing_capacity_f1(short pressing_capacity_f1) {
		this.pressing_capacity_f1 = pressing_capacity_f1;
	}
	public short getPressing_capacity_f2() {
		return pressing_capacity_f2;
	}
	public void setPressing_capacity_f2(short pressing_capacity_f2) {
		this.pressing_capacity_f2 = pressing_capacity_f2;
	}
	public short getForece_tolerance() {
		return forece_tolerance;
	}
	public void setForece_tolerance(short forece_tolerance) {
		this.forece_tolerance = forece_tolerance;
	}
	public short getPosition_abs() {
		return position_abs;
	}
	public void setPosition_abs(short position_abs) {
		this.position_abs = position_abs;
	}
	public short getPosition_relative() {
		return position_relative;
	}
	public void setPosition_relative(short position_relative) {
		this.position_relative = position_relative;
	}
	public short getDistance_tolerance() {
		return distance_tolerance;
	}
	public void setDistance_tolerance(short distance_tolerance) {
		this.distance_tolerance = distance_tolerance;
	}
	public short getHolding_time1() {
		return holding_time1;
	}
	public void setHolding_time1(short holding_time1) {
		this.holding_time1 = holding_time1;
	}
	public short getHolding_time2() {
		return holding_time2;
	}
	public void setHolding_time2(short holding_time2) {
		this.holding_time2 = holding_time2;
	}
	public short getNumber_of_loops() {
		return number_of_loops;
	}
	public void setNumber_of_loops(short number_of_loops) {
		this.number_of_loops = number_of_loops;
	}
	public short getSpeed_of_plunger() {
		return speed_of_plunger;
	}
	public void setSpeed_of_plunger(short speed_of_plunger) {
		this.speed_of_plunger = speed_of_plunger;
	}
	public short getGradient_of_force() {
		return gradient_of_force;
	}
	public void setGradient_of_force(short gradient_of_force) {
		this.gradient_of_force = gradient_of_force;
	}
	public short getFastcooling() {
		return fastcooling;
	}
	public void setFastcooling(short fastcooling) {
		this.fastcooling = fastcooling;
	}
	public short getGas_n2() {
		return gas_n2;
	}
	public void setGas_n2(short gas_n2) {
		this.gas_n2 = gas_n2;
	}
	public short getGas_ar() {
		return gas_ar;
	}
	public void setGas_ar(short gas_ar) {
		this.gas_ar = gas_ar;
	}
	public short getSpare() {
		return spare;
	}
	public void setSpare(short spare) {
		this.spare = spare;
	}
	public short getHydraulic_unit_off() {
		return hydraulic_unit_off;
	}
	public void setHydraulic_unit_off(short hydraulic_unit_off) {
		this.hydraulic_unit_off = hydraulic_unit_off;
	}
	public short getPress_capacity_control() {
		return press_capacity_control;
	}
	public void setPress_capacity_control(short press_capacity_control) {
		this.press_capacity_control = press_capacity_control;
	}
	public short getPress_position_control() {
		return press_position_control;
	}
	public void setPress_position_control(short press_position_control) {
		this.press_position_control = press_position_control;
	}
	public short getPress_distance_control() {
		return press_distance_control;
	}
	public void setPress_distance_control(short press_distance_control) {
		this.press_distance_control = press_distance_control;
	}
	
	
}
