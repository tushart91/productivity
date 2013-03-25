db.bugs.find().forEach(function(x)
{
	x.fields.firstUpdate = null;
	x.fields.updateDifference = null;
	x.fields.resolutionDifference = null;
	var seconds,numdays,numminutes,numseconds;
	try{
		for (var i=0;i<x.fields.comment.comments.length;i++)
		{
			if(Date.parse(ISODate(x.fields.comment.comments[i].created))>Date.parse(ISODate(x.fields.created))&&x.fields.comment.comments[i].updateAuthor.name != x.fields.reporter.name)
			{
				x.fields.firstUpdate = x.fields.comment.comments[i].created;
				break;
			}
		}
		if(x.fields.firstUpdate!=null)
		{
			seconds = (Date.parse(ISODate(x.fields.firstUpdate))-Date.parse(ISODate(x.fields.created)))/1000;
			x.fields.updateDifference = seconds;
		}
		
		if(x.fields.resolutiondate!=null)
		{
			seconds = (Date.parse(ISODate(x.fields.resolutiondate))-Date.parse(ISODate(x.fields.created)))/1000;
			x.fields.resolutionDifference = seconds;
		}
		print(".");
                db.bugs.update({_id: x._id},x)
	}
	catch(err){
	    print (x._id+': error while processing it');
	}
})
