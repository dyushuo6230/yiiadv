<?php
namespace backend\components;

use Yii;

class UserRule extends \yii\rbac\Rule 
{
	public function execute($user,$item,$params)
	{	
		//由于只针对update操作，当不是update直接放回true
		//当更新的用户id是当前用户 可以执行所有操作index update delete 等  Yii::$app->controller->action->id !== 'view' || 
		if (Yii::$app->controller->action->id == 'index') {
			return true;
		}
		if ($params) {
			if (Yii::$app->user->id == $params['id']) {
				return true;
			}
			
		}
		return false;
	}
}