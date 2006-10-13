/*
 * Created on Sep 15, 2004
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Generation - Code and Comments
 */
package gov.nci.planet.bean;

/**
 * @author dhankhav
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Generation - Code and Comments
 */
public class StatePlanBean {

	private int planStatus;
	private String planPeriod;
	private String planType;
	private String planUrl;
	private String name;
	private String state;

	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return Returns the planStatus.
	 */
	public int getPlanStatus() {
		return planStatus;
	}
	/**
	 * @param planStatus The planStatus to set.
	 */
	public void setPlanStatus(int planStatus) {
		this.planStatus = planStatus;
	}
	/**
	 * @return Returns the planPeriod.
	 */
	public String getPlanPeriod() {
		return planPeriod;
	}
	/**
	 * @param planPeriod The planPeriod to set.
	 */
	public void setPlanPeriod(String planPeriod) {
		this.planPeriod = planPeriod;
	}
	/**
	 * @return Returns the planType.
	 */
	public String getPlanType() {
		return planType;
	}
	/**
	 * @param planType The planType to set.
	 */
	public void setPlanType(String planType) {
		this.planType = planType;
	}
	/**
	 * @return Returns the planUrl.
	 */
	public String getPlanUrl() {
		return planUrl;
	}
	/**
	 * @param planUrl The planUrl to set.
	 */
	public void setPlanUrl(String planUrl) {
		this.planUrl = planUrl;
	}
	/**
	 * @return Returns the state.
	 */
	public String getState() {
		return state;
	}
	/**
	 * @param state The state to set.
	 */
	public void setState(String state) {
		this.state = state;
	}
}
