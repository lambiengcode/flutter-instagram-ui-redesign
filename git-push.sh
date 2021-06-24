read -p "input message: " message
git add .
git commit -m "$message"
echo "1. origin"
echo "2. wanted"
while :
do 
	read -p "push to remote: " input
	read -p "input branch: " branch
	case $input in
		1)
		git push origin $branch
		break
		;;
		2)
		git push wanted $branch
		break
		;;
		*)
		git push origin $branch
		break
		;;
	esac
done
echo "Push to remote successfully!"
